const TODAY = new Date('2025-09-28');

const people = [
  { id: 'ela', name: 'Elizabeth II', birthYear: 1926, deathYear: 2022 },
  { id: 'char', name: 'Charles III', birthYear: 1948, parentId: 'ela' },

  { id: 'william-parent', name: 'William, Prince of Wales', birthYear: 1982, parentId: 'char' },
  { id: 'harry', name: 'Prince Harry', birthYear: 1984, parentId: 'char' },
  { id: 'anne', name: 'Anne, Princess Royal', birthYear: 1950, parentId: 'ela' },
  { id: 'andrew', name: 'Prince Andrew', birthYear: 1960, parentId: 'ela' },
  { id: 'edward', name: 'Prince Edward', birthYear: 1964, parentId: 'ela' },

  { id: 'peter', name: 'Peter Phillips', birthYear: 1977, parentId: 'anne' },
  { id: 'zara', name: 'Zara Tindall', birthYear: 1981, parentId: 'anne' },
  { id: 'beatrice', name: 'Beatrice', birthYear: 1988, parentId: 'andrew' },
  { id: 'eugenie', name: 'Eugenie', birthYear: 1990, parentId: 'andrew' },
  { id: 'louise', name: 'Lady Louise', birthYear: 2003, parentId: 'edward' },
  { id: 'james', name: 'James, Viscount Severn', birthYear: 2007, parentId: 'edward' },

  { id: 'george', name: 'Prince George', birthYear: 2013, parentId: 'william-parent' },
  { id: 'charlotte', name: 'Princess Charlotte', birthYear: 2015, parentId: 'william-parent' },
  { id: 'louis', name: 'Prince Louis', birthYear: 2018, parentId: 'william-parent' },

  { id: 'archie', name: 'Archie Mountbatten-Windsor', birthYear: 2019, parentId: 'harry' },
  { id: 'lilibet', name: 'Lilibet Mountbatten-Windsor', birthYear: 2021, parentId: 'harry' }
];

const peopleById = new Map(people.map(p => [p.id, p]));
for (const p of people) p.children = [];
for (const p of people) {
  if (p.parentId && peopleById.has(p.parentId)) {
    peopleById.get(p.parentId).children.push(p.id);
  }
}

function getParentName(p) {
  if (!p.parentId) return '';
  const par = peopleById.get(p.parentId);
  return par ? par.name : '';
}
function getGrandParentName(p) {
  if (!p.parentId) return '';
  const par = peopleById.get(p.parentId);
  if (!par || !par.parentId) return '';
  const gp = peopleById.get(par.parentId);
  return gp ? gp.name : '';
}

function computeAge(p) {
  if (p.deathYear) return p.deathYear - p.birthYear;
  return TODAY.getFullYear() - p.birthYear;
}

function parentAgeAtBirth(child) {
  if (!child.parentId) return '';
  const par = peopleById.get(child.parentId);
  if (!par || !par.birthYear) return '';
  return child.birthYear - par.birthYear;
}

function renderTable(filterFn = () => true) {
  const tbody = document.querySelector('#familyTable tbody');
  tbody.innerHTML = '';

  for (const p of people) {
    if (!filterFn(p)) continue;

    const tr = document.createElement('tr');

    const nameTd = document.createElement('td');
    nameTd.textContent = p.name;
    if (p.name.replace(/\s+/g,'').length < 7) {
      nameTd.classList.add('green-short');
    }
    tr.appendChild(nameTd);

    const byTd = document.createElement('td');
    byTd.textContent = p.birthYear ?? '';
    tr.appendChild(byTd);

    const dyTd = document.createElement('td');
    dyTd.textContent = p.deathYear ?? '';
    tr.appendChild(dyTd);

    const parTd = document.createElement('td');
    parTd.textContent = getParentName(p);
    tr.appendChild(parTd);

    const gpTd = document.createElement('td');
    gpTd.textContent = getGrandParentName(p);
    tr.appendChild(gpTd);

    const childrenTd = document.createElement('td');
    childrenTd.textContent = p.children.map(id => peopleById.get(id).name).join(', ');
    tr.appendChild(childrenTd);

    const leafTd = document.createElement('td');
    const isLeaf = p.children.length === 0;
    leafTd.textContent = isLeaf ? 'Jah' : 'Ei';
    tr.appendChild(leafTd);

    const ageTd = document.createElement('td');
    ageTd.textContent = computeAge(p);
    tr.appendChild(ageTd);

    const paTd = document.createElement('td');
    const paa = parentAgeAtBirth(p);
    paTd.textContent = (paa === '' ? '' : paa);
    tr.appendChild(paTd);

    tbody.appendChild(tr);
  }
}

function renderSummary() {
  const el = document.getElementById('summary');

  const allBirths = people.map(p => `${p.name}: ${p.birthYear}`).join('<br/>');

  const twoPlus = people.filter(p => p.children.length >= 2).map(p => `${p.name} (${p.children.length})`);

  const leaves = people.filter(p => p.children.length === 0);
  const leavesStr = leaves.map(l => `${l.name}: ${computeAge(l)} a`).join('<br/>');

  el.innerHTML = `
    <div class="badge">Kõikide inimeste sünniaastad:</div><br/>
    ${allBirths}
    <hr/>
    <div class="badge">Nimed, kellel vähemalt 2 last:</div><br/>
    ${twoPlus.length ? twoPlus.join('<br/>') : '(Pole)'}
    <hr/>
    <div class="badge">Iga lapse vanus (leaf nodes):</div><br/>
    ${leavesStr}
    <hr/>
    <div style="font-size:0.9em;color:#555;">NB: sünniaastad on talletatud objektide atribuudina <code>birthYear</code>. Vanema ja vanavanaema nimed kuvatakse, kui parentId on teada.</div>
  `;
}

function buildFilter() {
  const qName = document.getElementById('qName').value.trim().toLowerCase();
  const qRegexRaw = document.getElementById('qRegex').value.trim();
  let qRegex = null;
  try { if (qRegexRaw) qRegex = new RegExp(qRegexRaw); } catch(e) { qRegex = null; }
  const qLen = document.getElementById('qLen').value;
  const only2plus = document.getElementById('only2plus').checked;

  return function(p) {
    if (qName) {
      if (!p.name.toLowerCase().includes(qName)) return false;
    }
    if (qRegex) {
      if (!qRegex.test(p.name)) return false;
    }
    if (qLen) {
      if (p.name.length !== Number(qLen)) return false;
    }
    if (only2plus && p.children.length < 2) return false;
    return true;
  };
}

document.addEventListener('DOMContentLoaded', () => {
  document.getElementById('apply').addEventListener('click', () => {
    const f = buildFilter();
    renderTable(f);
  });

  document.getElementById('reset').addEventListener('click', () => {
    document.getElementById('qName').value = '';
    document.getElementById('qRegex').value = '';
    document.getElementById('qLen').value = '';
    document.getElementById('only2plus').checked = false;
    renderTable();
  });

  renderSummary();
  renderTable();
});
