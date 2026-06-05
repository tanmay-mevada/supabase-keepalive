-- Go to your Supabase project → SQL Editor → run this query

-- Stores periodic keep-alive requests
CREATE TABLE IF NOT EXISTS keep_alive (
  id SERIAL PRIMARY KEY,              -- Unique ping ID
  pinged_at TIMESTAMPTZ DEFAULT NOW() -- Timestamp of the ping
);
