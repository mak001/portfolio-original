(function($) {
    var codeBlocks = $("[class*='language-']");
    if (codeBlocks.length > 0) {
        for (var i = 0; i < codeBlocks.length; i++) {
            var block = $(codeBlocks[i]);
            var classes = block.attr("class").split(' ');
           
            classes = classes.filter(function(item) {
                return item !== 'line-numbers';
            });
               
            var code = '<code class="' + classes.join(' ') + '">' + block.text() + '</code>';

            block.empty();
            block.append(code);
        }
    }
})(jQuery)