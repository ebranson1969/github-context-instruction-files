import org.gradle.api.tasks.Delete
import org.gradle.api.tasks.Copy

// Task to copy all files from .github to project root
tasks.register<Copy>("copyGithubToRoot") {
    description = "Copy all files from .github directory to project root"
    group = "setup"

    from(".github") {
        include("**/*")
    }
    into(".")

    // Overwrite existing files
    duplicatesStrategy = DuplicatesStrategy.INCLUDE
    includeEmptyDirs = false

    doFirst {
        println("Copying files from .github to project root...")
    }

    doLast {
        println("Successfully copied .github contents to project root")
    }
}

// Task to delete documents directory
tasks.register<Delete>("deleteDocuments") {
    description = "Delete documents directory and all its contents"
    group = "setup"

    delete("documents")

    doFirst {
        println("Deleting documents directory...")
    }

    doLast {
        println("Successfully deleted documents directory")
    }
}

// Configure build task to run our custom tasks
tasks.named("build") {
    dependsOn("copyGithubToRoot")
    finalizedBy("deleteDocuments")
}

// Configure clean task to also delete documents
tasks.register("cleanSetup") {
    description = "Clean setup by deleting documents directory"
    group = "setup"
    dependsOn("deleteDocuments")
}

// Ensure clean build runs our tasks in the right order
tasks.named("clean") {
    finalizedBy("cleanSetup")
}

// Default task configuration
defaultTasks("build")
