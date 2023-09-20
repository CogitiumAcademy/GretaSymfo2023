window.onload = () => {
    console.log("onload")
    let activate = document.querySelectorAll("[type=checkbox]")
    for(let button of activate) {
        button.addEventListener("click", function () {
            console.log("Clic")
            let xmlhttp = new XMLHttpRequest
            xmlhttp.open("get", `/admin/post/activate/${this.dataset.id}`)
            xmlhttp.send() 
        })
    }
}