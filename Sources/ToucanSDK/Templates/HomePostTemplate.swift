import Foundation

struct HomePostTemplate {

    struct Context {
        let meta: Meta
        let date: String

        var templateVariables: [String: String] {
            meta.templateVariables + [
                "date": date
            ]
        }
    }

    var file = "home-post.html"
    var templatesDir: URL
    var context: Context

    init(
        templatesDir: URL,
        context: Context
    ) {
        self.templatesDir = templatesDir
        self.context = context
    }

    func render() throws -> String {
        let templateUrl = templatesDir.appendingPathComponent(file)
        let template = try String(contentsOf: templateUrl)
        return template.replacingTemplateVariables(context.templateVariables)
    }
}