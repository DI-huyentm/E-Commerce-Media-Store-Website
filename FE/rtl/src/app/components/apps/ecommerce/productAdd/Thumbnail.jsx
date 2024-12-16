'use client'
import React from 'react';
import Box from '@mui/material/Box';
import { Typography, useTheme, Chip } from '@mui/material';
import { useDropzone } from 'react-dropzone'


const Thumbnail = () => {

  const theme = useTheme();

  const { acceptedFiles, getRootProps, getInputProps } = useDropzone();

  const files = acceptedFiles.map(file => (
    <Box
      key={file.path}
      sx={{
        display: "flex",
        alignItems: "center",
        py: 1,
        mt: 2,
        justifyContent: "space-between",
        borderTop: `1px solid ${theme.palette.divider}`
      }}>

            <Typography variant='body1' sx={{
              fontWeight: "500"
            }}>{file.path}  </Typography>
            <Chip color="primary" label={`${file.size} Bytes`} />
        </Box>
  ));


  return (
    (<Box sx={{
      p: 3
    }}>
      <Typography variant='h5'>Thumbnail</Typography>
      <Box
        {...getRootProps({ className: 'dropzone' })}
        sx={{
          mt: 3,
          fontSize: "12px",
          backgroundColor: 'primary.light',
          color: 'primary.main',
          padding: '30px',
          textAlign: 'center',
          border: `1px dashed`,
          borderColor: 'primary.main'
        }}>
        <input {...getInputProps()} />
        <p>Drag 'n' drop some files here, or click to select files</p>
      </Box>
      <Typography
        variant="body2"
        sx={{
          textAlign: "center",
          mt: 1
        }}>Set the product thumbnail image. Only *.png, *.jpg and *.jpeg image files are accepted.</Typography>
      <Box sx={{
        mt: 2
      }}>
        <Typography variant="h6" sx={{
          fontSize: "15px"
        }}>Files</Typography>
        <Typography variant="body1">{files}</Typography>
      </Box>
    </Box>)
  );
};

export default Thumbnail;
