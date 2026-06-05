-- Stores periodic keep-alive requests
CREATE TABLE IF NOT EXISTS keep_alive (
  id SERIAL PRIMARY KEY,              -- Unique ping ID
  pinged_at TIMESTAMPTZ DEFAULT NOW() -- Timestamp of the ping
);
ALTER TABLE keep_alive DISABLE ROW LEVEL SECURITY; --Ensures RLS Policies dont stop insertion for this table
