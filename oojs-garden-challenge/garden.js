//------------------------------------------------------------------------------------------------------------------
// YOUR CODE: Create your garden "object literal" and Flower "constructor" and "prototypes" here.
//------------------------------------------------------------------------------------------------------------------
// This is a flower constructor. This is like initializing a Flower class with attributes of name and color.

var Flower = function(name, color)
  {
    this.name = name;
    this.color = color;
  };

// This is a flower prototype method. This is like creating a class method on an object.

Flower.prototype.identify = function()
  {
    return "I am an " + this.name +" and I am " + this.color + ".";
  };

// This is an object literal garden

// this is like creating a hash object in ruby.
var garden =
  {
    name: "Kula Botanical Garden",
    location: "Makawao",

// This instantiates flower objects by planting it in the garden(this).
    plant: function(flowers){
      this.flowers = flowers;
    },

//This instantiates(picks) flowers from the garden by color
  selectByColor: function()
    {
      return this.flowers.filter(function(flower){
        return flower.color === "yellow";
      });
  },

//This instantiates(picks) flowers from the garden by name
  selectByName: function()
    {
      return this.flowers.filter(function(flower){
        return flower.name === "Iris";
      });
    }
};
//------------------------------------------------------------------------------------------------------------------
// DRIVER CODE: Do **NOT** change anything below this point. Your task is to implement code above to make this work.
//------------------------------------------------------------------------------------------------------------------

function assert(test, message) {
  if (!test) {
    throw "ERROR: " + message;
  }
  return true;
}

var flowers = [
  new Flower("Aster", "red"),
  new Flower("Bird of Paradise", "orange"),
  new Flower("Daffodil", "yellow"),
  new Flower("Gladiolus", "pink"),
  new Flower("Iris", "purple"),
  new Flower("Narcissus", "white"),
  new Flower("Chrysanthemum", "yellow"),
];

garden.plant(flowers);


assert(
  garden.name === "Kula Botanical Garden", "the garden has a name"
);
assert(
  garden.location === "Makawao", "the garden is located in Maui"
);
assert(
  garden.selectByColor("yellow").length === 2, "the garden should have 2 yellow flowers"
);
assert(
  garden.selectByName("Iris").length === 1, "the garden should have 1 Iris"
);
assert(
  flowers[0].identify() === "I am an Aster and I am red.", "asters are red"
);
assert(
  flowers[2].name === "Daffodil", "expected 'Daffodil'"
);
assert(
  flowers[0].identify === flowers[5].identify, "only one implementation of the identify() function should exist"
);

console.log("All tests passed");
