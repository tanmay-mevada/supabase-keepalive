# supabase-keepalive

Automatically keeps your Supabase free tier project alive by pinging the database every few days via GitHub Actions.

> **[Read the full step-by-step tutorial](./docs/TUTORIAL.md)**

---

## How it works

Supabase pauses free projects after **7 days of no database activity.**
This repo runs a scheduled GitHub Action every Monday and Thursday that inserts a row into a `keep_alive` table — resetting the timer automatically.

---

## Steps

### 1. Fork the repo
Click → [Fork supabase-keepalive](https://github.com/tanmay-mevada/supabase-keepalive/fork) → Hit **Create fork**

### 2. Create the table in Supabase
Go to your Supabase project → **[SQL Editor](https://supabase.com/dashboard/project/_/sql)** → paste this and hit run:

```sql
CREATE TABLE IF NOT EXISTS keep_alive (
  id SERIAL PRIMARY KEY,
  pinged_at TIMESTAMPTZ DEFAULT NOW()
);
ALTER TABLE keep_alive DISABLE ROW LEVEL SECURITY;
```

### 3. Add GitHub Secrets
Go to your forked repo → **Settings → Secrets and variables → Actions → New repository secret**

| Secret Name | Value |
|---|---|
| `SUPABASE_URL` | Your Supabase project URL *(Dashboard home)* |
| `SUPABASE_ANON_KEY` | Your `anon / public` key *([Settings → API](https://supabase.com/dashboard/project/_/settings/api))* |

### 4. Test it
Go to **Actions** tab → **Keep Supabase Alive** → **Run workflow**

Green checkmark = you're done. Your project will never pause again.

---

## Schedule

Runs every **Monday and Thursday at 9:00 AM UTC** by default.
To change the frequency, edit the cron in `.github/workflows/keep-supabase-alive.yml`:

```yaml
- cron: '0 9 * * 1,4'  # Mon and Thu — change this to whatever you want
```

---

## Detailed Tutorial

For a full step-by-step guide with screenshots, see [TUTORIAL.md](./docs/TUTORIAL.md)

---

## Issues

Found a bug or stuck on a step? [Open an issue](https://github.com/tanmay-mevada/supabase-keepalive/issues) and I'll help you out.

## License

MIT
