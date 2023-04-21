final: prev: {
  yarn = prev.yarn.override {
    nodejs = prev.nodejs-16_x;
  };
}
