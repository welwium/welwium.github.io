# WELWIUM Supabase setup

1. Create the Supabase project and an Auth user for `welwium@gmail.com`.
2. Run `supabase/schema.sql` in Dashboard -> SQL Editor.
3. Create a public Storage bucket named `site-media` from Storage -> New Bucket.
4. The frontend uses `VITE_SUPABASE_URL` and `VITE_SUPABASE_PUBLISHABLE_KEY`. The browser-safe publishable key is intentionally the only key used by the frontend. Never commit a secret/service-role key.

Official references:
- React quickstart: https://supabase.com/docs/guides/getting-started/quickstarts/reactjs
- API keys: https://supabase.com/docs/guides/getting-started/api-keys
- Storage buckets: https://supabase.com/docs/guides/storage/buckets/creating-buckets
- User management: https://supabase.com/docs/guides/auth/managing-user-data
