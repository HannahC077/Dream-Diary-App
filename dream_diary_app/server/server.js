const express = require('express');
const sqlite3 = require('sqlite3');
const { open } = require('sqlite');

const app = express();
const PORT = process.env.PORT || 3001;

let db;

async function initializeDatabase() {
  db = await open({
    filename: './dream_diary.db',
    driver: sqlite3.Database,
  });

  await db.exec(`
    CREATE TABLE IF NOT EXISTS Entry (
      id TEXT PRIMARY KEY,
      date TEXT,
      time TEXT,
      title TEXT,
      description TEXT
    );
  `);
}

initializeDatabase();

app.use(express.json());

class Entry {
  constructor(id, date, time, title, description) {
    this.id = id;
    this.date = date;
    this.time = time;
    this.title = title;
    this.description = description;
  }
}

// CRUD Endpoints
app.post('/entries', async (req, res) => {
  try {
    const { id, date, time, title, description } = req.body;
    await db.run(
      'INSERT INTO Entry (id, date, time, title, description) VALUES (?, ?, ?, ?, ?)',
      [id, date, time, title, description]
    );

    const newEntry = new Entry(id, date, time, title, description);
    res.json(newEntry);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

app.get('/entries', async (req, res) => {
  try {
    const entries = await db.all('SELECT * FROM Entry');
    res.json(entries.map((entry) => new Entry(entry.id, entry.date, entry.time, entry.title, entry.description)));
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

app.put('/entries/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const { date, time, title, description } = req.body;

    await db.run(
      'UPDATE Entry SET date=?, time=?, title=?, description=? WHERE id=?',
      [date, time, title, description, id]
    );

    const updatedEntry = new Entry(id, date, time, title, description);
    res.json(updatedEntry);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

app.delete('/entries/:id', async (req, res) => {
  try {
    const { id } = req.params;
    await db.run('DELETE FROM Entry WHERE id=?', [id]);
    res.json({ message: 'Entry deleted successfully' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Server Start
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

