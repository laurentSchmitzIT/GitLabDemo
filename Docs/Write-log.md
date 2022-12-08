---
external help file: LabModule-help.xml
Module Name: LabModule
online version:
schema: 2.0.0
---

# Write-log

## SYNOPSIS
Write-log short Help

## SYNTAX

### ParameterSetMain (Default)
```
Write-log [-Category <Object>] [-Message <Object>] [-Delimiter <String>] -Filepath <String> [-ToScreen]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ParameterSetHeader
```
Write-log [-Header] -Filepath <String> [-ToScreen] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ParameterSetFooter
```
Write-log [-Footer] -Filepath <String> [-ToScreen] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This is a long description of Write-log short

## EXAMPLES

### EXAMPLE 1
```
Write-log -filepath C:\temp\log.txt -header
```

### EXAMPLE 2
```
Write-log -filepath C:\temp\log.txt -Category......
```

## PARAMETERS

### -Header
Param1 help description

```yaml
Type: SwitchParameter
Parameter Sets: ParameterSetHeader
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Category
Param2 help description

```yaml
Type: Object
Parameter Sets: ParameterSetMain
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Message
{{ Fill Message Description }}

```yaml
Type: Object
Parameter Sets: ParameterSetMain
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Delimiter
{{ Fill Delimiter Description }}

```yaml
Type: String
Parameter Sets: ParameterSetMain
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Footer
Param3 help description

```yaml
Type: SwitchParameter
Parameter Sets: ParameterSetFooter
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Filepath
{{ Fill Filepath Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ToScreen
{{ Fill ToScreen Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### This is the inputs....
## OUTPUTS

### This is the outputs....
## NOTES
This is the notes....

## RELATED LINKS
