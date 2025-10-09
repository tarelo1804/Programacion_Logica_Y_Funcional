var ul = document.getElementById("lista")

let url = "https://thesimpsonsapi.com/api/"

let arr_original = []

var lis = ""

var getLista = (page)=>{
fetch(url+"characters?page="+page).then(response=>{
    if(!response.ok){
        console.log("Error en la red")
    }
    return response.json()
    }).then(data=>{
    console.log("Datos del Personaje: ", data)
    
    data.results.forEach(personaje=>{
        arr_original.push({
            personaje:personaje,
            datos:null
        })
        lis+=`
        <li>
            <img src="https://cdn.thesimpsonsapi.com/500${personaje.portrait_path}"width="200px"/>
            <h2>${personaje.name}</h2>
        </li>`
    })
    ul.innerHTML = lis
    console.log("Arreglo Final", arr_original)
})
}
for(let i=1;i<=5;i++){
    getLista(i)
}
setTimeout(()=>{
    document.getElementById("preloader").style.display = "none"
},2000)

const imprimir = (arr)=>{
    var todo = ""
    arr.forEach(item=>{
        todo+=`
        <li>
            <img src="https://cdn.thesimpsonsapi.com/500${item.personaje.portrait_path}"width="200px"/>
            <h2>${item.personaje.name}</h2>
        </li>`
    })
    ul.innerHTML=todo
}

//MOSTRAR TODO
document.querySelector("#mostrarTodo").addEventListener('click',(evt)=>{
    //Evitar Recarga
    evt.preventDefault()
    imprimir(arr_original)
})


//EDAD MENOR QUE 18
document.querySelector("#linkEdad").addEventListener('click',(evt)=>{
    //Evitar Recarga
    evt.preventDefault()
    let res = arr_original.filter((item)=>item.personaje.age<18)
    console.log("Edad: ", res)
    imprimir(res)
})

/*
-Personajes que estan muertos
-Menores de edad
-Promedio de edad
-Ordenar por edad (ascendente)
-Mostrar el más viejo y el más joven
-Mostrar los que son estudiantes
-Mostrar los items la fecha de nacimiento
Buscador por frases
*/


//PERSONAJES MUERTOS
document.querySelector("#linkMuertos").addEventListener('click',(evt)=>{
    //Evitar Recarga
    evt.preventDefault()
    let res = arr_original.filter((item)=>item.personaje.status == "Deceased")
    console.log("Personajes muertos: ", res)
    imprimir(res)
})

//PROMEDIO DE EDAD
document.querySelector("#linkPromedio").addEventListener('click',(evt)=>{
    //Evitar Recarga
    evt.preventDefault()
   
    let personajesConEdad = arr_original.filter((item)=>!isNaN(item.personaje.age) && item.personaje.age > 0)
    
  
    let sumaEdades = personajesConEdad.reduce((acum, item) => acum + item.personaje.age, 0)
    let promedio = sumaEdades / personajesConEdad.length
    
    alert(`El promedio de edad de los personajes es: ${promedio.toFixed(2)} años`)
    imprimir(arr_original)
})

//ORDENAR POR EDAD (ASCENDENTE)
document.querySelector("#linkOrdenar").addEventListener('click',(evt)=>{
    //Evitar Recarga
    evt.preventDefault()
    
  
    let personajesConEdad = arr_original.filter(item => !isNaN(item.personaje.age) && item.personaje.age > 0);
    let personajesSinEdad = arr_original.filter(item => isNaN(item.personaje.age) || item.personaje.age <= 0);
    

    personajesConEdad.sort((a, b) => a.personaje.age - b.personaje.age);
    

    let todosOrdenados = [...personajesConEdad, ...personajesSinEdad];
    
    console.log("Personajes ordenados por edad (TODOS): ", todosOrdenados);
    imprimir(todosOrdenados);
})

//MOSTRAR MÁS VIEJO Y MÁS JOVEN
document.querySelector("#linkViejoJoven").addEventListener('click',(evt)=>{
    //Evitar Recarga
    evt.preventDefault()
    

    let personajesConEdad = arr_original.filter((item)=>!isNaN(item.personaje.age) && item.personaje.age > 0)
    
    if (personajesConEdad.length > 0) {
        let masViejo = personajesConEdad.reduce((prev, curr) => 
            prev.personaje.age > curr.personaje.age ? prev : curr
        )
        
        let masJoven = personajesConEdad.reduce((prev, curr) => 
            prev.personaje.age < curr.personaje.age ? prev : curr
        )
        console.log("Más Viejo: ", masViejo)
        imprimir([masViejo, masJoven])
}})

//MOSTRAR ESTUDIANTES
document.querySelector("#linkEstudiantes").addEventListener('click',(evt)=>{
    //Evitar Recarga
    evt.preventDefault()
    
    let estudiantes = arr_original.filter((item)=>
        item.personaje.occupation && 
        (item.personaje.occupation.toLowerCase().includes("student") || 
         item.personaje.occupation.toLowerCase().includes("estudiante"))
    )
    
    console.log("Estudiantes: ", estudiantes)
    imprimir(estudiantes)
})

//MOSTRAR POR FECHA DE NACIMIENTO
document.querySelector("#linkFechaNacimiento").addEventListener('click',(evt)=>{
    //Evitar Recarga
    evt.preventDefault()
    
    const fechaLimite = new Date('1980-02-01')
    
    let personajesFiltrados = arr_original.filter((item)=>{
        if (item.personaje.birthdate) {
            const fechaNacimiento = new Date(item.personaje.birthdate)
            return fechaNacimiento < fechaLimite
        }
        return false
    })
    
    console.log("Personajes con fecha de nacimiento anterior a 1980/02/01: ", personajesFiltrados)
    imprimir(personajesFiltrados)
})

//BUSCADOR POR FRASES
const buscarPersonajes = () => {
    const searchText = document.querySelector("#searchInput").value.toLowerCase();
    
    if(!searchText.trim()) {
        alert("Por favor ingresa un texto para buscar");
        return;
    }
    
    let resultados = arr_original.filter((item) => {
        const personaje = item.personaje;
        
        // Buscar específicamente en el campo phrases del personaje
        if (personaje.phrases && Array.isArray(personaje.phrases)) {
            // Convertir cada frase a minúsculas para hacer la búsqueda insensible a mayúsculas/minúsculas
            return personaje.phrases.some(phrase => 
                phrase.toLowerCase().includes(searchText)
            );
        }
        return false;
    });
    
    console.log("Resultados de búsqueda por frase: " + searchText, resultados);
    
    if (resultados.length === 0) {
        alert("No se encontraron personajes con frases que coincidan con: " + searchText);
        return;
    }
    
    imprimir(resultados);
};

// Event listener para el botón de búsqueda (si existe)
const searchButton = document.querySelector("#searchButton");
if (searchButton) {
    searchButton.addEventListener('click', buscarPersonajes);
}

//Event listener con la tecla Enter
document.querySelector("#searchInput").addEventListener('keypress', (e) => {
    if (e.key === 'Enter') {
        e.preventDefault(); 
        buscarPersonajes();
    }
});