﻿using AutoMapper;
using BiblAI.Dto;
using BiblAI.Interfaces;
using BiblAI.Models;
using BiblAI.Repository;
using System.Security.Cryptography;

namespace BiblAI.Helper
{
    public class Mapping : Profile
    {
        public Mapping()
        {
            CreateMap<User, UserDto>()
                .ForMember(dest => dest.Posts, opt => opt.MapFrom(src => src.Posts));
            CreateMap<UserCreateDto, User>();
            CreateMap<Post, PostDto>()
                .ForMember(dest => dest.UserName, opt => opt.MapFrom<UserNameResolver>())
                .ForMember(dest => dest.ProfilePictureUrl, opt => opt.MapFrom<UserPictureResolver>())
                .ForMember(dest => dest.Comments, opt => opt.MapFrom(src => src.Comments))
                .ForMember(dest => dest.Verses, opt => opt.MapFrom(src => src.Verses))
                .ForMember(dest => dest.CommentsNum, opt => opt.MapFrom(src => src.Comments.Count))
                .ForMember(dest => dest.NumLikes, opt => opt.MapFrom<NumPostLikesResolver>())
                .ForMember(dest => dest.NumDislikes, opt => opt.MapFrom<NumPostDislikesResolver>())
                .ForMember(dest => dest.LikedByUser, opt => opt.MapFrom<PostLikedByUser>())
                .ForMember(dest => dest.DislikedByUser, opt => opt.MapFrom<PostDislikedByUser>());
            CreateMap<PostCreateDto, Post>();
            CreateMap<PostCreateDto, Comment>();
            CreateMap<VerseCreateDto, Verse>()
                .ForMember(dest => dest.Link, opt => opt.MapFrom<BookConvert>());
            CreateMap<Verse, VerseDto>();
            CreateMap<Comment, CommentDto>()
                .ForMember(dest => dest.UserName, opt => opt.MapFrom<UserNameResolver2>())
                .ForMember(dest => dest.ProfilePictureUrl, opt => opt.MapFrom<UserPictureResolver2>())
                .ForMember(dest => dest.NumLikes, opt => opt.MapFrom<NumCommentLikesResolver>())
                .ForMember(dest => dest.NumDislikes, opt => opt.MapFrom<NumCommentDislikesResolver>())
                .ForMember(dest => dest.LikedByUser, opt => opt.MapFrom<CommentLikedByUser>())
                .ForMember(dest => dest.DislikedByUser, opt => opt.MapFrom<CommentDislikedByUser>());
            CreateMap<CommentCreateDto, Comment>();
            CreateMap<LikeCreateDto, Like>()
                .ForMember(dest => dest.CommentId, opt => opt.Ignore());
        }
    }
}
