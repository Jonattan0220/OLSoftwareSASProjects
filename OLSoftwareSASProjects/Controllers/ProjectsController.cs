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
    public class ProjectsController : Controller
    {
        private readonly OLSoftwareSASProjectsContext _context;

        public ProjectsController(OLSoftwareSASProjectsContext context)
        {
            _context = context;
        }

        // GET: Projects
        public async Task<IActionResult> Index()
        {
            //INICIA TRANSACCIÓN EJECUTANDO PROCEDIMIENTO ALMACENADO
            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    var oLSoftwareSASProjectsContext = await _context.ProjectsViewModel.FromSqlRaw("EXEC SelectProject").ToListAsync();
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

        // GET: Projects/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Projects == null)
            {
                return NotFound();
            }

            var project = await _context.Projects
                .Include(p => p.Client)
                .Include(p => p.ProjectState)
                .FirstOrDefaultAsync(m => m.ProjectId == id);
            if (project == null)
            {
                return NotFound();
            }

            return View(project);
        }

        // GET: Projects/Languages/5
        public async Task<IActionResult> Languages(int? id)
        {
            if (id == null || _context.Projects == null)
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
                        new SqlParameter("@ProjectId", SqlDbType.Int) { Direction = ParameterDirection.Input, Value = id }
                    };
                    var oLSoftwareSASProjectsContext = await _context.ProjectLanguagesViewModel.FromSqlRaw("EXEC SelectProjectLanguage @ProjectId", parameters.ToArray()).ToListAsync();
                    transaction.Commit();
                    ViewData["ProjectId"] = id;
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

        // GET: Projects/Create
        public IActionResult Create()
        {
            ViewData["ClientId"] = new SelectList(_context.Clients, "ClientId", "LastName");
            ViewData["ProjectStateId"] = new SelectList(_context.ProjectStates, "ProjectStateId", "State");
            return View();
        }

        // POST: Projects/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ProjectId,StartDate,EndDate,Price,NumberOfHours,ClientId,ProjectStateId")] Project project)
        {
            if (!ModelState.IsValid)
            {
                ModelState.AddModelError(string.Empty, "Por favor volver a ingresar los datos requeridos");
                ViewData["ClientId"] = new SelectList(_context.Clients, "ClientId", "IdentificationNumber", project.ClientId);
                ViewData["ProjectStateId"] = new SelectList(_context.ProjectStates, "ProjectStateId", "State", project.ProjectStateId);
                return View(project);
            }

            if (Convert.ToDateTime(project.EndDate) < Convert.ToDateTime(project.StartDate))
            {
                ModelState.AddModelError(string.Empty, "La fecha final no puede ser menor a la fecha de inicio");
                ViewData["ClientId"] = new SelectList(_context.Clients, "ClientId", "IdentificationNumber", project.ClientId);
                ViewData["ProjectStateId"] = new SelectList(_context.ProjectStates, "ProjectStateId", "State", project.ProjectStateId);
                return View(project);
            }

            //INICIA TRANSACCIÓN EJECUTANDO PROCEDIMIENTO ALMACENADO
            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    var parameters = new List<SqlParameter>
                    {
                        new SqlParameter("@StartDate", SqlDbType.Date) { Direction = ParameterDirection.Input, Value = project.StartDate },
                        new SqlParameter("@EndDate", SqlDbType.Date) { Direction = ParameterDirection.Input, Value = project.EndDate },
                        new SqlParameter("@Price", SqlDbType.BigInt) { Direction = ParameterDirection.Input, Value = project.Price },
                        new SqlParameter("@NumberOfHours", SqlDbType.Int) { Direction = ParameterDirection.Input, Value = project.NumberOfHours },
                        new SqlParameter("@ClientId", SqlDbType.Int) { Direction = ParameterDirection.Input, Value = project.ClientId },
                        new SqlParameter("@ProjectStateId", SqlDbType.Int) { Direction = ParameterDirection.Input, Value = project.ProjectStateId }
                    };
                    await _context.Database.ExecuteSqlRawAsync("EXEC InsertProject @StartDate, @EndDate, @Price, @NumberOfHours, @ClientId, @ProjectStateId", parameters.ToArray());

                    transaction.Commit();
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    ViewData["TransactionErrorMessage"] = ex.Message;
                    ViewData["ClientId"] = new SelectList(_context.Clients, "ClientId", "IdentificationNumber", project.ClientId);
                    ViewData["ProjectStateId"] = new SelectList(_context.ProjectStates, "ProjectStateId", "State", project.ProjectStateId);
                    return View(project);
                }
                return RedirectToAction(nameof(Index));
            }
        }


        // GET: Projects/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Projects == null)
            {
                return NotFound();
            }

            var project = await _context.Projects.FindAsync(id);
            if (project == null)
            {
                return NotFound();
            }
            ViewData["ClientId"] = new SelectList(_context.Clients, "ClientId", "IdentificationNumber", project.ClientId);
            ViewData["ProjectStateId"] = new SelectList(_context.ProjectStates, "ProjectStateId", "State", project.ProjectStateId);
            return View(project);
        }

        // POST: Projects/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        //Tareas HttpPut no permitidas sobre algunos servidores, remover webDav y realizar el cambio
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ProjectId,StartDate,EndDate,Price,NumberOfHours,ClientId,ProjectStateId")] Project project)
        {
            if (id != project.ProjectId)
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
                        new SqlParameter("@ProjectId", SqlDbType.Int) { Direction = ParameterDirection.Input, Value = project.ProjectId },
                        new SqlParameter("@StartDate", SqlDbType.Date) { Direction = ParameterDirection.Input, Value = project.StartDate },
                        new SqlParameter("@EndDate", SqlDbType.Date) { Direction = ParameterDirection.Input, Value = project.EndDate },
                        new SqlParameter("@Price", SqlDbType.BigInt) { Direction = ParameterDirection.Input, Value = project.Price },
                        new SqlParameter("@NumberOfHours", SqlDbType.Int) { Direction = ParameterDirection.Input, Value = project.NumberOfHours },
                        new SqlParameter("@ClientId", SqlDbType.Int) { Direction = ParameterDirection.Input, Value = project.ClientId },
                        new SqlParameter("@ProjectStateId", SqlDbType.Int) { Direction = ParameterDirection.Input, Value = project.ProjectStateId }
                    };
                    await _context.Database.ExecuteSqlRawAsync("EXEC UpdateProject @ProjectId, @StartDate, @EndDate, @Price, @NumberOfHours, @ClientId, @ProjectStateId", parameters.ToArray());

                    transaction.Commit();
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    ViewData["TransactionErrorMessage"] = ex.Message;
                    ViewData["ClientId"] = new SelectList(_context.Clients, "ClientId", "IdentificationNumber", project.ClientId);
                    ViewData["ProjectStateId"] = new SelectList(_context.ProjectStates, "ProjectStateId", "State", project.ProjectStateId);
                    return View(project);
                }
                return RedirectToAction(nameof(Index));
            }
        }

        // GET: Projects/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Projects == null)
            {
                return NotFound();
            }

            var project = await _context.Projects
                .Include(p => p.Client)
                .Include(p => p.ProjectState)
                .FirstOrDefaultAsync(m => m.ProjectId == id);
            if (project == null)
            {
                return NotFound();
            }

            return View(project);
        }

        // POST: Projects/Delete/5
        //Tareas HttpDelete no permitidas sobre algunos servidores, remover webDav y realizar el cambio
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Projects == null)
            {
                return Problem("Entity set 'OLSoftwareSASProjectsContext.Projects'  is null.");
            }
            //INICIA TRANSACCIÓN EJECUTANDO PROCEDIMIENTO ALMACENADO
            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    var parameters = new List<SqlParameter>
                    {
                        new SqlParameter("@ProjectId", SqlDbType.Int) { Direction = ParameterDirection.Input, Value = id }
                    };
                    await _context.Database.ExecuteSqlRawAsync("EXEC DeleteProject @ProjectId", parameters.ToArray());

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

        private bool ProjectExists(int id)
        {
          return (_context.Projects?.Any(e => e.ProjectId == id)).GetValueOrDefault();
        }

        // GET: Projects/RegisterLanguage
        public IActionResult RegisterLanguage(int? id)
        {
            ViewData["ProgrammingLanguageId"] = new SelectList(_context.ProgrammingLanguages, "ProgrammingLanguageId", "ProgrammingLanguage1");
            ViewData["ProjectId"] = id;
            return View();
        }

        // POST: Projects/RegisterLanguage
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> RegisterLanguage(int id, [Bind("ProjectLanguageId,ProjectId,ProgrammingLanguageId")] ProjectLanguage projectLanguage)
        {
            if (!ModelState.IsValid)
            {
                ViewData["ProgrammingLanguageId"] = new SelectList(_context.ProgrammingLanguages, "ProgrammingLanguageId", "ProgrammingLanguage1");
                ViewData["ProjectId"] = id;
                return View(projectLanguage);
            }

            //INICIA TRANSACCIÓN EJECUTANDO PROCEDIMIENTO ALMACENADO
            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    var parameters = new List<SqlParameter>
                    {
                        new SqlParameter("@ProjectId", SqlDbType.Int) { Direction = ParameterDirection.Input, Value = id },
                        new SqlParameter("@ProgrammingLanguageId", SqlDbType.Int) { Direction = ParameterDirection.Input, Value = projectLanguage.ProgrammingLanguageId } 
                    };
                    await _context.Database.ExecuteSqlRawAsync("EXEC InsertProjectLanguage @ProjectId, @ProgrammingLanguageId", parameters.ToArray());

                    transaction.Commit();
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    ViewData["ProgrammingLanguageId"] = new SelectList(_context.ProgrammingLanguages, "ProgrammingLanguageId", "ProgrammingLanguage1");
                    ViewData["ProjectId"] = id;
                    return View(projectLanguage);
                }
                return RedirectToAction("Languages", new { id = id });
            }
        }
        // POST: Projects/DeleteLanguage
        [HttpPost, ActionName("DeleteLanguage")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteLanguage(int id)
        {
            if (_context.ProjectLanguages == null)
            {
                return Problem("Entity set 'OLSoftwareSASProjectsContext.ProjectLanguages'  is null.");
            }
            //INICIA TRANSACCIÓN EJECUTANDO PROCEDIMIENTO ALMACENADO
            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    var parameters = new List<SqlParameter>
                    {
                        new SqlParameter("@ProjectLanguageId", SqlDbType.Int) { Direction = ParameterDirection.Input, Value = id }
                    };
                    await _context.Database.ExecuteSqlRawAsync("EXEC DeleteProjectLanguage @ProjectLanguageId", parameters.ToArray());

                    transaction.Commit();
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    ViewData["TransactionErrorMessage"] = ex.Message;
                }
                return RedirectToAction("Languages", new { id = id });
            }
        }
    }
}
