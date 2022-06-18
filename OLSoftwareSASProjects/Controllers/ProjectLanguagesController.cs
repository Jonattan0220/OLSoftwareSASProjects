using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using OLSoftwareSASProjects.Models;

namespace OLSoftwareSASProjects.Controllers
{
    public class ProjectLanguagesController : Controller
    {
        private readonly OLSoftwareSASProjectsContext _context;

        public ProjectLanguagesController(OLSoftwareSASProjectsContext context)
        {
            _context = context;
        }


        // GET: ProjectLanguages/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.ProjectLanguages == null)
            {
                return NotFound();
            }

            var projectLanguage = await _context.ProjectLanguages
                .Include(p => p.ProgrammingLanguage)
                .Include(p => p.Project)
                .FirstOrDefaultAsync(m => m.ProjectLanguageId == id);
            if (projectLanguage == null)
            {
                return NotFound();
            }

            return View(projectLanguage);
        }

        // GET: ProjectLanguages/Create
        public IActionResult Create()
        {
            ViewData["ProgrammingLanguageId"] = new SelectList(_context.ProgrammingLanguages, "ProgrammingLanguageId", "ProgrammingLanguageId");
            ViewData["ProjectId"] = new SelectList(_context.Projects, "ProjectId", "ProjectId");
            return View();
        }

        // POST: ProjectLanguages/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ProjectLanguageId,ProjectId,ProgrammingLanguageId")] ProjectLanguage projectLanguage)
        {
            if (ModelState.IsValid)
            {
                _context.Add(projectLanguage);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["ProgrammingLanguageId"] = new SelectList(_context.ProgrammingLanguages, "ProgrammingLanguageId", "ProgrammingLanguageId", projectLanguage.ProgrammingLanguageId);
            ViewData["ProjectId"] = new SelectList(_context.Projects, "ProjectId", "ProjectId", projectLanguage.ProjectId);
            return View(projectLanguage);
        }

        // GET: ProjectLanguages/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.ProjectLanguages == null)
            {
                return NotFound();
            }

            var projectLanguage = await _context.ProjectLanguages.FindAsync(id);
            if (projectLanguage == null)
            {
                return NotFound();
            }
            ViewData["ProgrammingLanguageId"] = new SelectList(_context.ProgrammingLanguages, "ProgrammingLanguageId", "ProgrammingLanguageId", projectLanguage.ProgrammingLanguageId);
            ViewData["ProjectId"] = new SelectList(_context.Projects, "ProjectId", "ProjectId", projectLanguage.ProjectId);
            return View(projectLanguage);
        }

        // POST: ProjectLanguages/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ProjectLanguageId,ProjectId,ProgrammingLanguageId")] ProjectLanguage projectLanguage)
        {
            if (id != projectLanguage.ProjectLanguageId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(projectLanguage);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProjectLanguageExists(projectLanguage.ProjectLanguageId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["ProgrammingLanguageId"] = new SelectList(_context.ProgrammingLanguages, "ProgrammingLanguageId", "ProgrammingLanguageId", projectLanguage.ProgrammingLanguageId);
            ViewData["ProjectId"] = new SelectList(_context.Projects, "ProjectId", "ProjectId", projectLanguage.ProjectId);
            return View(projectLanguage);
        }

        // GET: ProjectLanguages/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.ProjectLanguages == null)
            {
                return NotFound();
            }

            var projectLanguage = await _context.ProjectLanguages
                .Include(p => p.ProgrammingLanguage)
                .Include(p => p.Project)
                .FirstOrDefaultAsync(m => m.ProjectLanguageId == id);
            if (projectLanguage == null)
            {
                return NotFound();
            }

            return View(projectLanguage);
        }

        // POST: ProjectLanguages/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.ProjectLanguages == null)
            {
                return Problem("Entity set 'OLSoftwareSASProjectsContext.ProjectLanguages'  is null.");
            }
            var projectLanguage = await _context.ProjectLanguages.FindAsync(id);
            if (projectLanguage != null)
            {
                _context.ProjectLanguages.Remove(projectLanguage);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ProjectLanguageExists(int id)
        {
          return (_context.ProjectLanguages?.Any(e => e.ProjectLanguageId == id)).GetValueOrDefault();
        }
    }
}
