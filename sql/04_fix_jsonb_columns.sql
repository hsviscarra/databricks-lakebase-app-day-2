-- Fix JSONB columns for Spark compatibility
-- Run this in your Lakebase database psql console

-- STEP 1: Check current column types
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'ticker_news_documents' 
AND column_name IN ('keywords', 'payload')
ORDER BY column_name;

-- STEP 2: Run this command to change JSONB to TEXT:
-- ALTER TABLE ticker_news_documents ALTER COLUMN keywords TYPE TEXT, ALTER COLUMN payload TYPE TEXT;

-- STEP 3: Verify the change
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'ticker_news_documents' 
AND column_name IN ('keywords', 'payload')
ORDER BY column_name;