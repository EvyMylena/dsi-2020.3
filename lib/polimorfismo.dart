class Animal {
  void comer() {
    print("Animal comendo.");
  }
}

class Gato extends Animal {
  @override
  void comer() {
    print("Gato comendo.");
  }
}

class Cachorro extends Animal {
  @override
  void comer() {
    print("Cachorro comendo.");
  }
}
