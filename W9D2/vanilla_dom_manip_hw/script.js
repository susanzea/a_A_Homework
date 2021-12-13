document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
  //GOAL
  //input a place
  //click submit button
  //input box clears
  //new item added to list

  document.querySelectorAll(".favorite-submit input").forEach((input) => {
    input.addEventListener("click", SubmitInput);
  });

  const SubmitInput = (e) => {
    const submitInput = e.target;
    
  };




  // adding new photos

  // --- your code here!



});
