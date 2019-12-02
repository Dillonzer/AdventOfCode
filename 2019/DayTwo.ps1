enum OpCodes
{
    Add = 1
    Multiply = 2
    Stop = 99
}

$outputNeeded = 19690720
$noun = 0
$verb = 0

do
{ 
    $input = @(1,$noun,$verb,3,1,1,2,3,1,3,4,3,1,5,0,3,2,6,1,19,1,19,9,23,1,23,9,27,1,10,27,31,1,13,31,35,1,35,10,39,2,39,9,43,1,43,13,47,1,5,47,51,1,6,51,55,1,13,55,59,1,59,6,63,1,63,10,67,2,67,6,71,1,71,5,75,2,75,10,79,1,79,6,83,1,83,5,87,1,87,6,91,1,91,13,95,1,95,6,99,2,99,10,103,1,103,6,107,2,6,107,111,1,13,111,115,2,115,10,119,1,119,5,123,2,10,123,127,2,127,9,131,1,5,131,135,2,10,135,139,2,139,9,143,1,143,2,147,1,5,147,0,99,2,0,14,0)
    
    for($i = 0; $i -lt $input.length; $i+=4)
    {
        if($input[$i] -eq [OpCodes]::Add.value__)
        {
            $firstNumberPosition = $input[$i+1]        
            $secondNumberPosition = $input[$i+2]       
            $sumPosition = $input[$i+3]

            $input[$sumPosition] = $input[$firstNumberPosition] + $input[$secondNumberPosition]
        }
        elseif($input[$i] -eq [OpCodes]::Multiply.value__)
        {
            $firstNumberPosition = $input[$i+1]        
            $secondNumberPosition = $input[$i+2]       
            $productPosition = $input[$i+3]

            $input[$productPosition] = $input[$firstNumberPosition] * $input[$secondNumberPosition]
        }
        elseif($input[$i] -eq [OpCodes]::Stop.value__)
        {
            Write-Host "End hit. Input Position 0 = $($input[0])" -ForegroundColor "Red"
        }
    }

    if($input[0] -ne $outputNeeded)
    {
        if($verb -ne 99)
        {
            $verb++        
        }
        else
        {
            $noun++
            $verb = 0
        }
    }

    Write-Host "NOUN: $noun`nVERB: $verb" -ForegroundColor "Yellow"

} while($input[0] -ne $outputNeeded)

$total = 100 * $noun + $verb

Write-Host "NOUN: $noun`nVERB: $verb`nTOTAL: $total" -ForegroundColor "Green"
