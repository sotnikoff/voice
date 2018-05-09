class VoiceController < ApplicationController
  def show
    respond_to do |format|
      format.all { render 'voice/show' }
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
