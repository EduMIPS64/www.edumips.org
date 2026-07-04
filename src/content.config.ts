import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

const news = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/news' }),
  schema: z.object({
    title: z.string(),
    date: z.coerce.date(),
    kind: z.enum(['release', 'note']).default('note'),
    source: z.string().url().optional(),
    excerpt: z.string().optional(),
  }),
});

export const collections = { news };
