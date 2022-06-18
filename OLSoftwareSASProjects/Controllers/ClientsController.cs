using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using OLSoftwareSASProjects.Models;

namespace OLSoftwareSASProjects.Controllers
{
    public class ClientsController : Controller
    {
        private readonly OLSoftwareSASProjectsContext _context;

        public ClientsController(OLSoftwareSASProjectsContext context)
        {
            _context = context;
        }

        // GET: Clients
        public async Task<IActionResult> Index()
        {
            //INICIA TRANSACCIÓN EJECUTANDO PROCEDIMIENTO ALMACENADO
            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    var oLSoftwareSASProjectsContext = await _context.ClientsViewModel.FromSqlRaw("EXEC SelectClient").ToListAsync();
                    transaction.Commit();
                    return View(oLSoftwareSASProjectsContext);
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    ViewData["TransactionErrorMessage"] = ex.Message;
                    return View();
                }
            }
        }

        // GET: Clients/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Clients == null)
            {
                return NotFound();
            }

            var client = await _context.Clients
                .Include(c => c.IdentificationType)
                .FirstOrDefaultAsync(m => m.ClientId == id);
            if (client == null)
            {
                return NotFound();
            }

            return View(client);
        }

        // GET: Clients/Create
        public IActionResult Create()
        {
            ViewData["IdentificationTypeId"] = new SelectList(_context.IdentificationTypes, "IdentificationTypeId", "Type");
            return View();
        }

        // POST: Clients/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ClientId,FirstName,LastName,PhoneNumber,Address,IdentificationTypeId,IdentificationNumber")] Client client)
        {
            if (!ModelState.IsValid)
            {
                ModelState.AddModelError(string.Empty, "Por favor volver a ingresar los datos requeridos");
                ViewData["IdentificationTypeId"] = new SelectList(_context.IdentificationTypes, "IdentificationTypeId", "Type", client.IdentificationTypeId);
                return View(client);
            }

            //INICIA TRANSACCIÓN EJECUTANDO PROCEDIMIENTO ALMACENADO
            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    var parameters = new List<SqlParameter>
                    {
                        new SqlParameter("@FirstName", SqlDbType.VarChar) { Direction = ParameterDirection.Input, Value = client.FirstName },
                        new SqlParameter("@LastName", SqlDbType.VarChar) { Direction = ParameterDirection.Input, Value = client.LastName },
                        new SqlParameter("@PhoneNumber", SqlDbType.VarChar) { Direction = ParameterDirection.Input, Value = client.PhoneNumber },
                        new SqlParameter("@Address", SqlDbType.VarChar) { Direction = ParameterDirection.Input, Value = client.Address },
                        new SqlParameter("@IdentificationTypeId", SqlDbType.Int) { Direction = ParameterDirection.Input, Value = client.IdentificationTypeId },
                        new SqlParameter("@IdentificationNumber", SqlDbType.BigInt) { Direction = ParameterDirection.Input, Value = client.IdentificationNumber }
                    };
                    await _context.Database.ExecuteSqlRawAsync("EXEC InsertClient @FirstName, @LastName, @PhoneNumber, @Address, @IdentificationTypeId, @IdentificationNumber", parameters.ToArray());

                    transaction.Commit();
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    ViewData["TransactionErrorMessage"] = ex.Message;
                    ViewData["IdentificationTypeId"] = new SelectList(_context.IdentificationTypes, "IdentificationTypeId", "Type", client.IdentificationTypeId);
                    return View(client);
                }
                return RedirectToAction(nameof(Index));
            }

        }

        // GET: Clients/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Clients == null)
            {
                return NotFound();
            }

            var client = await _context.Clients.FindAsync(id);
            if (client == null)
            {
                return NotFound();
            }
            ViewData["IdentificationTypeId"] = new SelectList(_context.IdentificationTypes, "IdentificationTypeId", "Type", client.IdentificationTypeId);
            return View(client);
        }

        // POST: Clients/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        //Tareas HttpPut no permitidas sobre algunos servidores, remover webDav y realizar el cambio
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ClientId,FirstName,LastName,PhoneNumber,Address,IdentificationTypeId,IdentificationNumber")] Client client)
        {
            if (id != client.ClientId)
            {
                return NotFound();
            }

            //INICIA TRANSACCIÓN EJECUTANDO PROCEDIMIENTO ALMACENADO
            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    var parameters = new List<SqlParameter>
                    {
                        new SqlParameter("@ClientId", SqlDbType.Int) { Direction = ParameterDirection.Input, Value = client.ClientId },
                        new SqlParameter("@FirstName", SqlDbType.VarChar) { Direction = ParameterDirection.Input, Value = client.FirstName },
                        new SqlParameter("@LastName", SqlDbType.VarChar) { Direction = ParameterDirection.Input, Value = client.LastName },
                        new SqlParameter("@PhoneNumber", SqlDbType.VarChar) { Direction = ParameterDirection.Input, Value = client.PhoneNumber },
                        new SqlParameter("@Address", SqlDbType.VarChar) { Direction = ParameterDirection.Input, Value = client.Address },
                        new SqlParameter("@IdentificationTypeId", SqlDbType.Int) { Direction = ParameterDirection.Input, Value = client.IdentificationTypeId },
                        new SqlParameter("@IdentificationNumber", SqlDbType.BigInt) { Direction = ParameterDirection.Input, Value = client.IdentificationNumber }
                    };
                    await _context.Database.ExecuteSqlRawAsync("EXEC UpdateClient @ClientId, @FirstName, @LastName, @PhoneNumber, @Address, @IdentificationTypeId, @IdentificationNumber", parameters.ToArray());

                    transaction.Commit();
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    ViewData["TransactionErrorMessage"] = ex.Message;
                    ViewData["IdentificationTypeId"] = new SelectList(_context.IdentificationTypes, "IdentificationTypeId", "Type", client.IdentificationTypeId);
                    return View(client);
                }
                return RedirectToAction(nameof(Index));
            }
        }

        // GET: Clients/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Clients == null)
            {
                return NotFound();
            }

            var client = await _context.Clients
                .Include(c => c.IdentificationType)
                .FirstOrDefaultAsync(m => m.ClientId == id);
            if (client == null)
            {
                return NotFound();
            }

            return View(client);
        }

        // POST: Clients/Delete/5
        //Tareas HttpDelete no permitidas sobre algunos servidores, remover webDav y realizar el cambio
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Clients == null)
            {
                return Problem("Entity set 'OLSoftwareSASProjectsContext.Clients'  is null.");
            }
            //INICIA TRANSACCIÓN EJECUTANDO PROCEDIMIENTO ALMACENADO
            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    var parameters = new List<SqlParameter>
                    {
                        new SqlParameter("@ClientId", SqlDbType.Int) { Direction = ParameterDirection.Input, Value = id }
                    };
                    await _context.Database.ExecuteSqlRawAsync("EXEC DeleteClient @ClientId", parameters.ToArray());

                    transaction.Commit();
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    ViewData["TransactionErrorMessage"] = ex.Message;
                }
                return RedirectToAction(nameof(Index));
            }
        }

        private bool ClientExists(int id)
        {
          return (_context.Clients?.Any(e => e.ClientId == id)).GetValueOrDefault();
        }
    }
}
