class VoiceController < ApplicationController
  def convert
    file = ConvertTextToSpeech.call(params[:text], 'us-east-1', 'Maxim')
    send_data(file.audio_stream.read, filename: "#{Time.now}.mp3")
  end
end
