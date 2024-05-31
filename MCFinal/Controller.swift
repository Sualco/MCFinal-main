import Foundation
import Firebase

@Observable class Controller {
    var ideas: [Idea] = []
    var requests: [Request] = []
    var userr: User = User()
    var projects: [Project] = []
    var tags: [String] = []
    var communities: [Community] = []
    
    func getIdeas() {
        ideas.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Ideas")
        
        ref.getDocuments { [weak self] snapshot, error in
            guard let self = self else { return }
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    if let id = data["id"] as? String,
                       let name = data["name"] as? String,
                       let author = data["author"] as? String,
                       let text = data["text"] as? String,
                       let lookingFor = data["lookingFor"] as? String,
                       let tags = data["tags"] as? [String],
                       let isOpen = data["isOpen"] as? Bool {
                        
                        let idea = Idea(id: id, name: name, author: author, text: text, lookingFor: lookingFor, tags: tags, isOpen: isOpen)
                        DispatchQueue.main.async {
                            self.ideas.append(idea)
                        }
                    } else {
                        print("Error parsing document data: \(document.data())")
                    }
                }
            }
        }
    }
    
    func getRequests() {
        requests.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Requests")
        
        ref.getDocuments(completion: { [weak self] snapshot, error in
            guard let self = self else { return }
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    if let id = data["id"] as? String,
                       let user = data["user"] as? String,
                       let idea = data["idea"] as? String,
                       let isAccepted = data["isAccepted"] as? Bool {
                        
                        let request = Request(id: id, user: user, idea: idea, isAccepted: isAccepted)
                        DispatchQueue.main.async {
                            self.requests.append(request)
                        }
                    } else {
                        print("Error parsing document data: \(document.data())")
                    }
                }
            }
        })
    }
    
    func getUser() {
        userr=User()
        let db = Firestore.firestore()
        let ref = db.collection("Users")
        
        ref.getDocuments(completion: { [weak self] snapshot, error in
            guard let self = self else { return }
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    if let id = data["id"] as? String,
                       let name = data["name"] as? String,
                       let username = data["username"] as? String,
                       let role = data["role"] as? String {
                        
                        let userr = User(id: id, name: name, usename: username, ruolo: role)
                        DispatchQueue.main.async {
                            self.userr = userr
                        }
                    } else {
                        print("Error parsing document data: \(document.data())")
                    }
                }
            }
        })
    }
    
    func getProjects() {
        projects.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Projects")
        
        ref.getDocuments(completion: { [weak self] snapshot, error in
            guard let self = self else { return }
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    if let id = data["id"] as? String,
                       let author = data["author"] as? String,
                       let name = data["name"] as? String,
                       let link = data["link"] as? String,
                       let summary = data ["summary"] as? String,
                       let creationString = data ["creation"] as? String,
                       let tags = data["tags"] as? [String]{
                        
                        let formatter = DateFormatter()
                        formatter.dateFormat = "HH:mm E, d MMM y"
                        let creation = formatter.date(from: creationString)
                        
                        let project = Project(id: id, author: author, name: name, summary: summary, tags: tags, link: link, creation: creation!)
                        DispatchQueue.main.async {
                            self.projects.append(project)
                        }
                    } else {
                        print("Error parsing document data: \(document.data())")
                    }
                }
            }
        })
    }
    
    func getTags() {
        tags.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Tags")
        
        ref.getDocuments(completion: { [weak self] snapshot, error in
            guard let self = self else { return }
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    if let name = data["name"] as? String{
                        
                        DispatchQueue.main.async {
                            self.tags.append(name)
                        }
                    } else {
                        print("Error parsing document data: \(document.data())")
                    }
                }
            }
        })
    }
    
    func getCommunities() {
        communities.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Communities")
        
        ref.getDocuments(completion: { [weak self] snapshot, error in
            guard let self = self else { return }
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    if let id = data["id"] as? String,
                       let name = data["name"] as? String,
                       let password = data["password"] as? String,
                       let summary = data["summary"] as? String{
                        
                        let community = Community(id: id, name: name, password: password, summary: summary)
                        DispatchQueue.main.async {
                            self.communities.append(community)
                        }
                    } else {
                        print("Error parsing document data: \(document.data())")
                    }
                }
            }
        })
    }
    
    func addIdea(idea: Idea){
        let db = Firestore.firestore()
        let ref = db.collection("Ideas").document(idea.id)
        ref.setData(["author": idea.author, "id": idea.id, "isOpen": idea.isOpen, "lookingFor": idea.lookingFor, "text": idea.text, "tags": idea.tags, "name": idea.name]){error in
            print(error?.localizedDescription ?? "")
        }
    }
    
    func addProject(project: Project){
        let db = Firestore.firestore()
        let ref = db.collection("Projects").document(project.id)
        ref.setData(["author": project.author, "creation": project.creation, "id": project.id, "link": project.link, "summary": project.summary, "tags": project.tags, "name": project.name]){error in
            print(error?.localizedDescription ?? "")
        }
    }
    
}
