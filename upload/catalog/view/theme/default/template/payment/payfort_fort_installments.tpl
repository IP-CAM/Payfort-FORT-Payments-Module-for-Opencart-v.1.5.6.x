<div class="buttons">
  <div class="right">
    <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="button" />
  </div>
</div>
<script type="text/javascript"><!--
$('#button-confirm').bind('click', function () {
        $.ajax({
            url: 'index.php?route=payment/payfort_fort_installments/send',
            type: 'post',
            dataType: 'json',
            beforeSend: function () {
                $('#button-confirm').attr('disabled', true);
            },
            complete: function () {
                $('#button-confirm').attr('disabled', false);
                $('.attention').remove();
            },
            success: function (json) {

                if (json['form']) {
                    $('body').append(json['form']);
                    $('#frm_payfort_fort_payment input[type=submit]').click();
                }
                
                else{
                    showError('<?php echo $text_general_error;?>');
                }
            }
        });
    });

function showError(msg){
    $('input[name="payment_method"][value="payfort_fort"]').parent().parent().find('td:last-child').append("<span class='error'><br/><?php echo $text_error_card_decline;?><span>");
    $('#payment-method>.checkout-heading').find('a:first-child').trigger('click');
}
//--></script>
