const express = require('express')
const cors = require('cors')
const app = express()

app.use(cors())
app.use(express.json())

let students = [
  { id: 1, name: "Anna", age: 18 },
  { id: 2, name: "Markus", age: 16 },
  { id: 3, name: "Liisa", age: 14 },
  { id: 4, name: "Karl", age: 19 }
]

app.get('/', (req, res) => {
  let html = "<!doctype html><html><head><title>Students API</title></head><body>"
  html += "<h1>Students</h1><ul>"
  for (let s of students) {
    html += `<li><a href='/students/${s.id}'>${s.name} (${s.age})</a></li>`
  }
  html += "</ul><p><a href='/students'>All students JSON</a></p></body></html>"
  res.send(html)
})

app.get('/students', (req, res) => {
  res.json(students)
})

app.get('/students/:id', (req, res) => {
  const student = students.find(s => s.id == req.params.id)
  if (!student) return res.status(404).json({ error: "Not found" })
  res.json(student)
})

app.post('/students', (req, res) => {
  const { name, age } = req.body
  if (!name || !age) return res.status(400).json({ error: "Missing name or age" })
  const newStudent = { id: nextId(), name, age }
  students.push(newStudent)
  res.status(201).json(newStudent)
})

app.delete('/students/:id', (req, res) => {
  const idx = students.findIndex(s => s.id == req.params.id)
  if (idx === -1) return res.status(404).json({ error: "Not found" })
  students.splice(idx, 1)
  res.sendStatus(204)
})

app.listen(8080, () => {
  console.log("Server running on http://localhost:8080")
})

function nextId() {
  return students.length > 0 ? Math.max(...students.map(s => s.id)) + 1 : 1
}
