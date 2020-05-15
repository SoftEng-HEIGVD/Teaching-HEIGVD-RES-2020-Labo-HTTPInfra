$(function(){
        console.log("Loading animals");

        function loadAnimals(){
                $.getJSON( "/api/gnar/", function (animals) {
                        console.log(animals);
                        var message = "Your lucky animals: " +
                                animals[0].animal + ", " +
                                animals[1].animal + ", " +
                                animals[2].animal + ".";
                        $("#gnar").text(message);
                });
        };

        loadAnimals();
        setInterval(loadAnimals, 2000);
});