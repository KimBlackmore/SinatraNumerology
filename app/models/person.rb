class Person < ActiveRecord::Base
	
	def self.valid_birthdate(input)
		if input.length==8 && input.match(/^[0-9]+[0-9]$/)
			return true
		else
			return false
		end
	end

	def self.get_birth_path_num(birthdate)

		total = 0
		birthdate.split("").each do |ch|
			total += ch.to_i
		end
		newnumber = total.to_s

		newtotal = newnumber[0].to_i + newnumber[1].to_i
		newnumber2 = newtotal.to_s

		if newtotal >9
			lasttotal = newnumber2[0].to_i + newnumber2[1].to_i
			newnumber2 = lasttotal.to_s
		else
			lasttotal = newtotal
		end
		return lasttotal
	end

	def self.get_message(birth_path_number)
		message = {
		    1 => "One is the leader. The number one indicates the ability to stand alone, and is a strong vibration. Ruled by the Sun.",
		    2 => "This is the mediator and peace-lover. The number two indicates the desire for harmony. It is a gentle, considerate, and sensitive vibration. Ruled by the Moon." ,
		    3 => "Number Three is a sociable, friendly, and outgoing vibration. Kind, positive, and optimistic, Three's enjoy life and have a good sense of humor. Ruled by Jupiter.",
		    4 => "This is the worker. Practical, with a love of detail, Fours are trustworthy, hard-working, and helpful. Ruled by Uranus." ,
		    5 => "This is the freedom lover. The number five is an intellectual vibration. These are 'idea' people with a love of variety and the ability to adapt to most situations. Ruled by Mercury." ,
		    6 => "This is the peace lover. The number six is a loving, stable, and harmonious vibration. Ruled by Venus." ,
		    7 => "This is the deep thinker. The number seven is a spiritual vibration. These people are not very attached to material things, are introspective, and generally quiet. Ruled by Neptune." ,
		    8 => "This is the manager. Number Eight is a strong, successful, and material vibration. Ruled by Saturn." ,
		    9 =>  "This is the teacher. Number Nine is a tolerant, somewhat impractical, and sympathetic vibration. Ruled by Mars." 
		}  
		return message[birth_path_number.to_i]
	end


end