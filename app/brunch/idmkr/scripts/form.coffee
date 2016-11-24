$.fn.toggleFormError = (enable = true, msg = '' ) ->
    if enable == true
        classAdded = 'invalid'
        classRemoved = 'valid'
        attrAdded = 'data-error'
        attrRemoved = 'data-success'
    else if enable == false
        classAdded = 'valid'
        classRemoved = 'invalid'
        attrAdded = 'data-success'
        attrRemoved = 'data-error'
    else
        classRemoved = 'invalid valid'
        attrRemoved = 'data-error data-success'


    $('[for="'+$(this).attr('id')+'"]')
        .attr attrAdded, msg
        .removeAttr attrRemoved

    $(this).addClass(classAdded).removeClass(classRemoved)


module.exports =
    bind: (selector) ->
        $form = $(selector)
        submitTxt = ''
        $form.ajaxForm
            beforeSubmit: ->
                submitTxt = $form.find(':submit').html()
                $form.find(':submit').html '...'

            success: (errors) ->
                if errors
                    $.each $.parseJSON(errors), (name, error) ->
                        $('[name="'+name+'"]')
                            .toggleFormError(true, error)
                            .one 'keydown', -> $(@).toggleFormError null

                    $.fn.fullpage.moveTo(
                        $('[data-error]').first().focus().parents('[data-anchor]').attr("data-anchor")
                    )
                    $form.find(':submit').html submitTxt

                else
                    #$form.find('[name]').each -> $(this).toggleFormError(false)

                    $form.find(':submit').replaceWith '<p>Merci.<br>Nous vous répondrons dans les meilleurs délais.</p>'