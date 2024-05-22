Amazon Textract is a service that automatically **extracts text, handwriting, and data from scanned documents**. It goes beyond simple **optical character recognition (OCR)** to also identify the contents of fields in forms and information stored in tables. This service is powered by machine learning to recognize and process document formats without manual intervention.

### How Does Amazon Textract Work?

1. **Document Analysis:**
    
    - Textract analyzes document images and PDF files. You can upload documents directly to the service or store them in Amazon S3 and point Textract to the S3 bucket.
2. **Text Extraction:**
    
    - The service detects and extracts text from documents, which includes not only machine-printed text but also handwritten text with high accuracy.
3. **Form and Table Recognition:**
    
    - Textract goes beyond text extraction to recognize the structure of forms and tables within documents. It understands the layout and relationships between fields and entries, enabling it to capture the underlying context of the information.
4. **Data Processing:**
    
    - Once extracted, the information can be used to populate databases, spreadsheets, or can be further processed and analyzed by other AWS services or third-party applications.
5. **Machine Learning Models:**
    
    - Textract uses machine learning models that have been trained on millions of documents to deliver high accuracy in text and data extraction. These models continue to improve over time as they are exposed to more documents.

#### Use Cases for Amazon Textract

1. **Automated Document Processing:**
    
    - Organizations can automate the processing of various document types, such as forms, invoices, receipts, and contracts, reducing manual data entry and errors.
2. **Data Migration:**
    
    - Textract can be used to digitize legacy documents, facilitating the migration of data from paper records to digital databases.
3. **Compliance and Record Keeping:**
    
    - For industries that require maintaining accurate records, such as healthcare or finance, Textract can help maintain compliance by digitizing and structuring information.
4. **Searchable Archives:**
    
    - By converting scanned documents into text, Textract makes it possible to create searchable archives of historical data.
5. **Content Management Systems:**
    
    - Textract can feed content into CMSs, enabling enhanced content discoverability and organization.
6. **Loan Processing:**
    
    - In the financial sector, Textract can expedite the loan application process by extracting data from submitted documents quickly and accurately.
7. **Healthcare Data Management:**
    
    - Textract can help healthcare providers digitize patient forms, medical records, and insurance documents for better data management and analysis.

### Amazon Textract: Comprehensive Breakdown

#### Detect and Analyse Text Contained in Input Documents

- **Functionality:** Amazon Textract uses machine learning to automatically detect and extract text, handwriting, and data from digital documents. Unlike traditional OCR tools, it can understand the document's layout, such as columns, tables, and forms.

#### Input = JPEG, PNG, PDF, or TIFF

- **Supported Formats:** Textract can process various document formats including common image formats (JPEG, PNG) and document formats (PDF, TIFF).
- **Versatility:** This range of supported formats makes Textract suitable for many use cases, such as processing scanned documents, photos of documents, and digital files.

#### Output = Extracted Text, Structure, and Analysis

- **Extracted Text:** The service outputs the detected text, making it usable for text analytics, database entry, and further processing.
- **Structure:** Textract preserves the structure of the information it extracts, such as the layout of a form or the organization of data within tables.
- **Analysis:** The service also analyzes the document to understand the relationships between different text elements, which is crucial for processing complex documents like tax forms or applications.

#### Most Documents = Synchronous (Real-time)

- **Real-time Processing:** For most standard-sized documents, Textract operates synchronously, processing and returning results in real-time.
- **Immediate Results:** This is ideal for applications that require immediate feedback, such as interactive web forms or mobile apps.

#### Large Documents (Big PDFs) = Asynchronous

- **Batch Processing:** Larger documents, such as lengthy PDFs, are processed asynchronously. Textract can handle larger workloads by queuing documents and processing them as resources are available.
- **Scalability:** This approach allows Textract to scale for high-volume document processing, making it suitable for back-office tasks, batch processing jobs, and archiving purposes.

#### Pay for Usage ... Custom Pricing Available for Large Volume

- **Cost-Effective:** Textract follows a pay-as-you-go pricing model, which means you only pay for the number of pages or units of information you process.
- **Custom Pricing:** For businesses with large volumes of documents, Amazon offers custom pricing options to make the service more cost-effective at scale.