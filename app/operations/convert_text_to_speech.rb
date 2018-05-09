module ConvertTextToSpeech
  extend self
  def call(text, region, voice_id)
    client = Aws::Polly::Client.new(region: region,
                                    access_key_id: Rails.application.credentials.dig(:aws, :access_key_id),
                                    secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key)
    )
    client.synthesize_speech(text: text,
                             output_format: 'mp3',
                             voice_id: voice_id,
                             text_type: 'text'
    )
  end
end
