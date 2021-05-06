let allAnimals = [];
let editId;

function getHtmlRegister(animals) {
   return animals.map((animal, i) => {
    return `<tr> 
    <td>${i+1}</td>
    <td>${animal.nrCrotal}</td>
    <td>${animal.sex}</td>
    <td>${animal.birthday}</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>
        <a href="#" class="delete-btn" data-id="${registru.id}">✖</a> 
        <a href="#" class="edit-btn" data-id="${registru.id}">✎</a>
    </td>   
    </tr>`
}).join("")
}

 function showAnimals(animals) {
    const html = getHtmlRegister(animals);

    const tbody = document.querySelector("#registru tbody");
    tbody.innerHTML = html;
}
 
function loadAnimals() {
    fetch("/registru")
    .then(r => r.json())
    .then(animals => {
        allAnimals = animals;
        showAnimals(animals);
    });
}
loadAnimals();

function addAnimal(animal) {
    fetch("http://localhost:3000/animals/create", { 
        method: "POST",
        body: JSON.stringify(animal),
        headers: {
            "Content-Type": "application/json"
        }
    })
    .then(r => r.json())
    .then(status => {
        if (status.success) {
            window.location.reload();
        }
    });
}


document.querySelector("table tbody").addEventListener("click", e => {
    if (e.target.matches("a.remove-btn")) {
        const id = e.target.getAttribute('data-id');
        removeAnimal(id);
    } else if (e.target.matches("a.edit-btn")) {
        document.getElementById('saveBtn').innerText = 'Update';

        const id = e.target.getAttribute('data-id');
        const editAnimal = allAnimals.find(animal => animal.id == id);
        setValues(editAnimal);
        editId = id;
    }
});


