module MailerHelper

  def email_button_link(text, url, opts = {})
   """
      <table width='100%' border='0' cellspacing='0' cellpadding='0' style='#{opts[:style]}'>
        <tr>
          <td>
            <table border='0' cellspacing='0' cellpadding='0'>
              <tr>
                <td align='center' style='border-radius: 3px;' bgcolor='#3273e2'><a href='#{url}' target='_blank' style='font-size: 16px; font-family: Helvetica, Arial, sans-serif; color: #ffffff; text-decoration: none; text-decoration: none;border-radius: 3px; padding: 12px 18px; border: 1px solid transparent; display: inline-block;font-weight: 700;'>#{text}</a></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
   """.html_safe
  end

end
