# www.edumips.org

Source for the [EduMIPS64](https://github.com/EduMIPS64/edumips64) project
website, published at [www.edumips.org](https://www.edumips.org). Built with
[Astro](https://astro.build).

## Running locally

```sh
npm install
npm run dev
```

This starts a local dev server (by default at `http://localhost:4321`) that
reloads as you edit files.

To produce a production build in `dist/`, run:

```sh
npm run build
```

You can preview that production build locally with `npm run preview`.

## Adding a news post

News items live in `src/content/news/` as one Markdown file per post, with
frontmatter for the title and date:

1. Create `src/content/news/YYYY-MM-DD-slug.md`, e.g.
   `src/content/news/2026-09-01-release-1.5.0.md`.
2. Add frontmatter and body:

   ```md
   ---
   title: "Release 1.5.0 (codename: Example)"
   date: 2026-09-01
   ---

   Body of the announcement, in Markdown.
   ```

3. Commit and push to `master`. The site is rebuilt and deployed
   automatically via the GitHub Actions workflow in
   `.github/workflows/deploy.yml`.

The five most recent posts are shown in full on the home page; older posts
are collapsed under "Older news".
