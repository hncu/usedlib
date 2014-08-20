
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.web.multipart.MultipartFile

@Transactional(readOnly = true)
class ProfileController {
	
    static allowedMethods = [save: "POST",  delete: "DELETE"]//update: "GET,POST",
	def hdImageService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Profile.list(params), model:[profileInstanceCount: Profile.count()]
    }

    def show(Profile profileInstance) {
        respond profileInstance
    }

    def create() {
        respond new Profile(params)
    }

    @Transactional
    def save(Profile profileInstance) {
        if (profileInstance == null) {
            notFound()
            return
        }

        if (profileInstance.hasErrors()) {
            respond profileInstance.errors, view:'create'
            return
        }

        profileInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'profileInstance.label', default: 'Profile'), profileInstance.id])
                redirect profileInstance
            }
            '*' { respond profileInstance, [status: CREATED] }
        }
    }

    def edit(Profile profileInstance) {
        respond profileInstance
    }

    @Transactional
    def update(Profile profileInstance) {
        if (profileInstance == null) {
            notFound()
            return
        }

        if (profileInstance.hasErrors()) {
            respond profileInstance.errors, view:'edit'
            return
        }
		println params.profileContent
		switch(params.profileContent){
			case "base": break
			
			case "avatar":
				def uploadedFile = request.getFile('payload')
				
				if(!uploadedFile.empty){
				  //println "Class: ${uploadedFile.class}"
				  //println "Name: ${uploadedFile.name}"
				  //println "OriginalFileName: ${uploadedFile.originalFilename}"
				  //println "Size: ${uploadedFile.size}"
				  //println "ContentType: ${uploadedFile.contentType}"
				  
				  def webRootDir = servletContext.getRealPath("/")
				  //println "webRootDir"+webRootDir
				  def userDir = new File(webRootDir, "/images/avatar/")
				  if(!userDir.exists()){
					  userDir.mkdirs()
				  }
				  String filename=uploadedFile.originalFilename
				  String fileEx = filename.substring(filename.indexOf("."),filename.length());
				  
				  def profi=Profile.findById(session.ShiroUser.id)
				  profi.bAvatar=session.ShiroUser.id.toString()+fileEx//userDir.toString()+"\\"+
				  
				  FileOutputStream fos=new FileOutputStream(userDir.toString()+"\\"+profi.bAvatar)
				  fos.write(hdImageService.scale(uploadedFile.getInputStream(), 100, 100))
				  fos.close()
				}
				break
			case "gps": println "gps";break
			
		}

        profileInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Profile.label', default: 'Profile'), profileInstance.id])
                redirect profileInstance
            }
            '*'{ respond profileInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Profile profileInstance) {

        if (profileInstance == null) {
            notFound()
            return
        }

        profileInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Profile.label', default: 'Profile'), profileInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'profileInstance.label', default: 'Profile'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
