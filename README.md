## Steps

### 1. Create the table in Supabase

Go to your Supabase project → **SQL Editor** → paste this and hit run:

```sql
CREATE TABLE IF NOT EXISTS keep_alive (
  id SERIAL PRIMARY KEY,
  pinged_at TIMESTAMPTZ DEFAULT NOW()
);
```

### 2. Add GitHub Secrets

Go to your forked repo → **Settings → Secrets and variables → Actions → New repository secret**


| Secret Name | Value |
|---|---|
| `SUPABASE_URL` | Your Supabase project URL |
| `SUPABASE_SERVICE_ROLE_KEY` | Your `service_role` key *(Settings → API)* |

### 3. Test it

Go to **Actions** tab → **Keep Supabase Alive** → **Run workflow**

Green checkmark = you're done. Your project will never pause again.

---
