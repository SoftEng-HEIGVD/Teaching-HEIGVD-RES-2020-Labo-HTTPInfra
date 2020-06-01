$(function() {
  console.log("Loading animals");

  function loadAnimals() {
    $.getJSON("/api/animals/", function(animals) {
      console.log(animals);
      var message = "No animal showed up :(";
      if (animals.length > 0) {
        message = "Did you know? " + animals[0];
      }
      $("#animals").text(message);
    });
  };
  
  loadAnimals();
  setInterval(loadAnimals, 5000);
});

