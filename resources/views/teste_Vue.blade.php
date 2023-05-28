<body>
    {{-- Elemento HTML para montar a aplicação Vue --}}
    <div id="app">
        {{-- Componente Vue --}}
        <teste-vue-componente :teste_props="{{ json_encode($teste) }}"></teste-vue-componente>
    </div>
    {{-- Incluindo o arquivo app.js --}}
    <script src="{{ asset('js/app.js') }}"></script>
</body>
