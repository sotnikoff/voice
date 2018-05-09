class VoiceController < ApplicationController
  def show
    @bot_name = if params[:voice] == 'Maxim'
                  'Многоуважаемый бот Максим Максимович'
                elsif params[:voice] == 'Tatyana'
                  'Несравненная Елена Ивановна'
                else
                  'Какой-то неизвестный бот'
                end
  end

  def convert
    file = ConvertTextToSpeech.call(params[:text], 'us-east-1', params[:voice], params[:audio_format])
    extension = if params[:audio_format] == 'ogg_vorbis'
                  'ogg'
                else
                  params[:audio_format]
                end
    send_data(file.audio_stream.read, filename: "#{Time.now}.#{extension}")
  end
end
