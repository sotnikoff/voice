class VoiceController < ApplicationController
  def convert
    puts params[:text]
    file = ConvertTextToSpeech.call(params[:text], 'us-east-1', 'Maxim')
    puts file.audio_stream
    send_data(file.audio_stream.read, filename: 'test.mp3')
  end
end
