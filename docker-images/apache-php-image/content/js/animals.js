$(function()
{
    console.log("loading some animals");

    function loadAnimals()
    {
        $.getJSON("/api/animals/", function (animals)
        {
            var message = "Liste des animaux :";

            $.each(animals, function(i, item)
            {
                message = message.concat (' ', animals[i].animal);
            });
            
            $("#myAnimals").text(message);
        })
    }

    loadAnimals();
    setInterval(loadAnimals, 2000);
});