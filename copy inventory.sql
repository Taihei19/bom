psql -h localhost -p 5432 -U username -d databasename

\copy composition from 'fullpath\inventory.csv' WITH CSV header;
