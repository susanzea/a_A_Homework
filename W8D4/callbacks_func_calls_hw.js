
// simple timeout
window.setTimeout(() => {alert('HAMMERTIME')}, 5000)



// timeout plus closure
function hammerTime(time) {
    window.setTimeout(() => { console.log(`${time} is hammertime!`)}, time)
}



