module Api
  module V1
    class ReadingsController < ApplicationController
      skip_forgery_protection

      def create
        sensor = Sensor.find(params[:sensor_id])

        token = request.headers["X-SENSOR-TOKEN"].to_s

        unless ActiveSupport::SecurityUtils.secure_compare(
          sensor.api_token, token
        )
          return render json: {
            error: "Unauthorized"
          }, status: :unauthorized
        end

        reading = sensor.sensor_readings.create!(
          value: params.require(:value),
          recorded_at: params[:recorded_at].presence || Time.current
        )

        AlertEvaluator.call(reading)

        render json: {
          message: "Reading received successfully",
          sensor: sensor.name,
          value: reading.value,
          unit: sensor.unit
        }, status: :created
      rescue ActiveRecord::RecordInvalid => error
        render json: {
          error: error.record.errors.full_messages
        }, status: :unprocessable_entity
      rescue ActiveRecord::RecordNotFound
        render json: {
          error: "Sensor not found"
        }, status: :not_found
      end
    end
  end
end