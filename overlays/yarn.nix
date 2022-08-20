final: prev: {
  yarn = prev.yarn.override {
    nodejs = nodejs-16_x;
  };
}
