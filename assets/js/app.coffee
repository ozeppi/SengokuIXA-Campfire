$ ->
    resetForm = ()->
        $('#x').val('')
        $('#y').val('')

    $('#x').on 'change', (evt)->
        xValue = $(this).val()
        console.log xValue
        if xValue.match(/(-?\d+),\s?(-?\d+)/)
            x = RegExp.$1
            y = RegExp.$2
            $(this).val(x)
            $('#y').val(y)

    $('#submitButton').on 'click', (evt)->
        console.log 'fire submit'
        evt.preventDefault()
        evt.stopPropagation()
        x = $('#x').val()
        y = $('#y').val()
        resetForm unless x && y
        if $('#' + x + '_' + y).length
            resetForm()
            alert('already exists!')
            $('#x').focus()
            return false

        return $(this).parent('form').trigger('submit')
