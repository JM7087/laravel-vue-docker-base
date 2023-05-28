<template>
    <div>
      <h1>oi</h1>
      {{ testeView }}
    </div>
  </template>
  
  <script>
  export default {
    name: 'TesteVue',
    props: ['teste_props'],
    data() {
      return {
        teste: null,
      };
    },
    mounted() {
      this.teste = this.teste_props;
    },
    computed: {
      testeView() {
        console.log(this.teste);
        return this.teste;
      },
    },
    methods: {
  
    },
  };
  </script>
  
  <style scoped></style>