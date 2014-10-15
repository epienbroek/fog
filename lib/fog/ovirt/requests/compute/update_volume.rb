module Fog
  module Compute
    class Ovirt
      class Real

        def update_volume(id, options)
          raise ArgumentError, "instance id is a required parameter" unless id
          raise ArgumentError, "disk id is a required parameter for update-volume" unless options.has_key? :id

          disk_id = options[:id]
          options.delete(:id)

          client.update_volume(id, disk_id, options)
        end

      end

      class Mock
        def update_volume(id, disk_id, options)
          raise ArgumentError, "instance id is a required parameter" unless id
          raise ArgumentError, "disk id is a required parameter for update-volume" unless options.has_key? :id
          true
        end

      end
    end
  end
end
