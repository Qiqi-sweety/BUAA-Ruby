console.log("Hello from custom/buyer_change.js");

const triggerTabList = document.querySelectorAll('#nav-tab button')
triggerTabList.forEach(triggerEl => {
    triggerEl.addEventListener('click', event => {
        event.preventDefault()
        //for each tab button, remove show and active class
        triggerTabList.forEach(triggerEl => {
            const dataTarget = triggerEl.getAttribute('data-bs-target')
            $(dataTarget).removeClass('show active')
            triggerEl.classList.remove('active')
        })
        let button= event.target
        //add active class to button
        button.classList.add('active')
        //get data-bs-targe
        const dataTarget = button.getAttribute('data-bs-target')
        console.log(dataTarget)
        //add show class to target
        $(dataTarget).addClass('show active')
        
    })
}
);