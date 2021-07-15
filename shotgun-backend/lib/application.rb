class Application

    def call(env)

        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/doctors/) && req.get?
            doctors = Doctor.all.map do |doctor|
                {id: doctor.id, name: doctor.name, speciality: doctor.speciality}
            end

            return [200, { 'Content-Type' => 'application/json' }, [ {:doctors => doctors}.to_json ]]  

        else
            resp.write "Path Not Found"
        end

        resp.finish

    end

  end