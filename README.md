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

## Adding a post

All posts live in `src/content/news/` as one Markdown file per post. There
are two kinds:

- `kind: release` — shown in the **Revision history** table (home page shows
  the 5 most recent; the full table is at `/revisions/`). The version and
  codename are parsed from a title of the form
  `Release X.Y.Z (codename: Name)`.
- `kind: note` — an **Application note**: any announcement or article. Each
  note gets its own page at `/news/<file-name>/`; the home page lists the 5
  most recent and the full list is at `/news/`.

1. Create `src/content/news/YYYY-MM-DD-slug.md`, e.g.
   `src/content/news/2026-09-01-release-1.5.0.md`.
2. Add frontmatter and body:

   ```md
   ---
   title: "Release 1.5.0 (codename: Example)"
   date: 2026-09-01
   kind: release
   ---

   Body of the announcement, in Markdown.
   ```

   Notes may also carry an `excerpt` (a short plain-text summary shown in
   lists; the full body is on the note's page) and a `source` URL recording
   where the post was first published.

3. Commit and push to `master`. The site is rebuilt and deployed
   automatically via the GitHub Actions workflow in
   `.github/workflows/deploy.yml`.

## Updating the release version

Search `src/pages/index.astro` for the current version number (e.g. `1.4.0`)
to update the download button and manual link, and add the matching
`kind: release` post.
