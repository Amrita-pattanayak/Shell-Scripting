# Shell-Scripting
# CSV Data Sanitization and Restructuring Shell Script

This shell script is designed to sanitize and restructure CSV data containing URLs and titles. The script categorizes URLs based on common prefixes and consolidates titles under corresponding categories.

## Usage

1. **Input CSV Data**: Place your input CSV file containing URLs and titles in the following format:

    ```
    URL,Description
    https://example.com/data/ai,Example AI Overview - Test
    https://example.com/data/ai/campus,Example AI Campus - Test
    https://example.com/data/ai/courses,Example AI Courses 2023-2024
    https://example.com/data/php/campus,PHP Institute, India Campus Facilities – PHP
    https://example.com/data/php/courses,PHP Institute, India Courses & Fees – PHP
    https://example.com/data/php/scholarships,PHP Institute, India Scholarships – PHP
    https://example.com/data/php/admission,PHP Institute, India Admission Process – PHP
    https://example.com/data/python,Python Institute - India overview – Python
    https://example.com/data/python/campus,Python Institute - India Campus Facilities – Python
    https://example.com/data/python/courses,Python Institute - India Courses & Fees – Python
    https://example.com/data/python/scholarships,Python Institute - India Scholarships – Python
    https://example.com/data/python/placement,Python Institute - India Results – Python
    https://example.com/data/python/results,Python Institute - India Results – Python
    ```

2. **Run the Script**: Execute the shell script by running the following command in your terminal:

    ```bash
    ./sanitize_csv.sh
    ```

3. **Output**: The script will generate an output CSV file (`output.csv`) with the restructured data in the desired format:

    ```
    URL,overview,campus,courses,scholarships,admission,placements,results
    https://example.com/data/ai,Example AI Overview - Test,Example AI Campus - Test,Example AI Courses 2023-2024,,,,,
    https://example.com/data/php,,PHP Institute, India Campus Facilities – PHP,PHP Institute, India Courses & Fees – PHP,PHP Institute, India Scholarships – PHP,PHP Institute, India Admission Process – PHP,,,
    https://example.com/data/python,Python Institute - India overview – Python,Python Institute - India Campus Facilities – Python,Python Institute - India Courses & Fees – Python,Python Institute - India Scholarships – Python,,Python Institute - India Results – Python
    ```

## Requirements

- **CSV Data Processing**: The script reads and processes the input CSV file containing URLs and titles.
- **URL Categorization**: URLs are analyzed to identify common prefixes and categorize them accordingly.
- **Title Consolidation**: Titles are grouped under corresponding URL categories to ensure accurate alignment.
- **Sanitization**: Mechanisms are implemented to handle irregularities in URLs and titles, such as special characters or inconsistent formatting.
- **Output CSV Generation**: An output CSV file with the restructured data is generated following the desired format.
- **Category Assignment**: Categories are assigned to URLs based on their common prefixes, ensuring logical organization and readability.
- **Handling Missing Data**: Cases where titles are missing or incomplete are accounted for, providing appropriate placeholders or handling strategies in the output CSV.
- **Error Handling**: Error handling mechanisms are implemented to address issues such as file not found, incorrect formatting, or unexpected data patterns.
- **Documentation**: Clear documentation within the shell script explains the purpose of each function and the overall workflow.
- **Testing and Validation**: Thorough testing and validation of the shell script with various input scenarios ensure the accuracy and reliability of the output CSV data.
- **Scalability and Flexibility**: The script is designed to be scalable and adaptable to accommodate changes in input data formats or requirements in the future.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
