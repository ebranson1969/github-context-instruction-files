# Project Prompt Example 1: Documentation Generation Scenario

## Scenario Description
A developer has created a new utility function for handling file uploads with validation and needs comprehensive documentation for the team's API reference.

## Context Information
- **Project:** Content Management System
- **Technology Stack:** Python, Flask, SQLAlchemy
- **File:** `utils/file_handler.py`
- **Feature:** File upload validation and processing utility

## Code to Document
```python
import os
import mimetypes
from werkzeug.utils import secure_filename
from PIL import Image

def process_upload(file, upload_path, allowed_extensions=None, max_size_mb=10):
    """
    Process and validate file uploads with size and type restrictions.
    """
    if allowed_extensions is None:
        allowed_extensions = {'txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'}
    
    if not file or file.filename == '':
        raise ValueError("No file provided")
    
    filename = secure_filename(file.filename)
    if not filename:
        raise ValueError("Invalid filename")
    
    file_ext = filename.rsplit('.', 1)[1].lower()
    if file_ext not in allowed_extensions:
        raise ValueError(f"File type not allowed. Allowed: {allowed_extensions}")
    
    file.seek(0, os.SEEK_END)
    file_size = file.tell()
    file.seek(0)
    
    if file_size > max_size_mb * 1024 * 1024:
        raise ValueError(f"File too large. Max size: {max_size_mb}MB")
    
    if file_ext in {'png', 'jpg', 'jpeg', 'gif'}:
        try:
            img = Image.open(file)
            img.verify()
            file.seek(0)
        except Exception:
            raise ValueError("Invalid image file")
    
    file_path = os.path.join(upload_path, filename)
    file.save(file_path)
    
    return {
        'filename': filename,
        'path': file_path,
        'size': file_size,
        'type': mimetypes.guess_type(filename)[0]
    }
```

## Applied Prompt Template
Using the **Documentation Generation Prompt** from `.github/prompts/project.prompt.md`:

```
Generate comprehensive documentation for the following code/feature:
- Purpose and functionality
- Usage examples
- Parameter descriptions
- Return value details
- Any important notes or warnings

Context: Python utility function for file upload processing in CMS
Requirements: Team API documentation, docstring format, practical examples
Audience: Backend developers, integration teams

[CODE INSERTED ABOVE]
```

## Expected AI Response Structure
```
## File Upload Processor Documentation

### Purpose and Functionality
The `process_upload` function provides secure file upload processing with validation for file type, size, and integrity. It handles common upload scenarios including image verification and generates secure filenames to prevent directory traversal attacks.

### Parameters

#### Required Parameters
- **file** (`FileStorage`): Werkzeug FileStorage object from request
- **upload_path** (`str`): Destination directory path for uploaded files

#### Optional Parameters
- **allowed_extensions** (`set`, default: `{'txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'}`): 
  Set of allowed file extensions (case-insensitive)
- **max_size_mb** (`int`, default: `10`): Maximum file size in megabytes

### Return Value
Returns a dictionary containing:
- **filename** (`str`): Sanitized filename
- **path** (`str`): Full file path where file was saved
- **size** (`int`): File size in bytes
- **type** (`str`): MIME type of the file

### Usage Examples

#### Basic Usage
```python
from utils.file_handler import process_upload

# In your Flask route
@app.route('/upload', methods=['POST'])
def upload_file():
    file = request.files['file']
    try:
        result = process_upload(file, '/uploads')
        return jsonify(result)
    except ValueError as e:
        return jsonify({'error': str(e)}), 400
```

#### Custom Configuration
```python
# Allow only images, max 5MB
result = process_upload(
    file, 
    '/uploads/images',
    allowed_extensions={'png', 'jpg', 'jpeg'},
    max_size_mb=5
)
```

### Error Handling
The function raises `ValueError` exceptions for:
- Missing or empty files
- Invalid filenames
- Disallowed file extensions
- Files exceeding size limits
- Corrupted image files

### Important Notes
- Files are automatically renamed using `secure_filename()` for security
- Image files undergo integrity verification using PIL
- The upload directory must exist and be writable
- File size is checked before processing to prevent memory issues

### Dependencies
- `werkzeug.utils.secure_filename`
- `PIL.Image` (for image validation)
- Standard library: `os`, `mimetypes`
```

## Key Learning Points
- Provide clear context about the code's purpose and environment
- Request specific documentation format (docstring, API docs, etc.)
- Include audience information to tailor the documentation level
- Ask for practical usage examples alongside technical details

---
*Example Type: Documentation Generation*
*Complexity Level: Intermediate*
*Focus Areas: Python, File Handling, API Documentation*
