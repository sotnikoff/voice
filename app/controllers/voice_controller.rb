class VoiceController < ApplicationController
  def convert
    file = ConvertTextToSpeech.call(params[:text], 'us-east-1', params[:voice], params[:format])
    extension = if params[:format] == 'ogg_vorbis'
                  'ogg'
                else
                  params[:format]
                end
    send_data(file.audio_stream.read, filename: "#{Time.now}.#{extension}")
  end
end
